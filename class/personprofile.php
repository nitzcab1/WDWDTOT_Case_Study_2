<?php

class PersonProfile{

    // database connection and table name
    private $conn;
    private $table_name = "personprofile";

    public $profileid;
    public $firstname;
    public $lastname;
    public $middlename;
    public $gender;
    public $address;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function global_escape_string($value)
	{
		$search = array("\\",  "\x00", "\n",  "\r",  "'",  '"', "\x1a");
	    $replace = array("\\\\","\\0","\\n", "\\r", "\'", '\"', "\\Z");

	    return str_replace($search, $replace, $value);
	}
    public function run_query($query)
    {
        // mysqli_next_result($this->conn);
        $Result = mysqli_query($this->conn, $query);
        $json = array();
        if(!empty($Result) && $Result->num_rows > 0){
            while ($row = mysqli_fetch_assoc($Result)) {
                $row = array_map('utf8_encode', $row);
                array_push($json, $row);
            }
        }
        // mysqli_close($this->conn);

        return $json;
    }

    public function create(){
        $statement = $this->conn->prepare("INSERT INTO " . $this->table_name . " (firstname, lastname, middlename, gender, address) VALUES (?, ?, ?, ?, ?)");
        $statement->bind_param("sssss",$this->firstname,$this->lastname,$this->middlename,$this->gender,$this->address);

        //sanitize
        $this->firstname=htmlspecialchars(strip_tags($this->firstname));
        $this->lastname=htmlspecialchars(strip_tags($this->lastname));
        $this->middlename=htmlspecialchars(strip_tags($this->middlename));
        $this->gender=htmlspecialchars(strip_tags($this->gender));
        $this->address=htmlspecialchars(strip_tags($this->address));

        if($statement->execute()){
            $statement->close();
            return true;
        }

        echo ("Error: " . $this->conn->error);
        return false;
    }

    public function update(){
        $statement = $this->conn->prepare("UPDATE " . $this->table_name . " SET firstname = ?, lastname = ?, middlename = ?, gender = ?, address = ? WHERE profileid = " . $this->profileid . "");
        $statement->bind_param("sssss",$this->firstname,$this->lastname,$this->middlename,$this->gender,$this->address);

        //sanitize
        $this->firstname=htmlspecialchars(strip_tags($this->firstname));
        $this->lastname=htmlspecialchars(strip_tags($this->lastname));
        $this->middlename=htmlspecialchars(strip_tags($this->middlename));
        $this->gender=htmlspecialchars(strip_tags($this->gender));
        $this->address=htmlspecialchars(strip_tags($this->address));

        if($statement->execute()){
            $statement->close();
            return true;
        }

        echo ("Error: " . $this->conn->error);
        return false;
    }

    public function delete(){
        $statement = $this->conn->prepare("DELETE FROM " . $this->table_name . " WHERE profileid = " . $this->profileid);

        if($statement->execute()){
            $statement->close();
            return true;
        }

        echo ("Error: " . $this->conn->error);
        return false;
    }

    public function getdashboarddata() {
        mysqli_next_result($this->conn);
        $sql = "SELECT COUNT(*) AS numofprofiles FROM " . $this->table_name;

        $result = mysqli_query($this->conn, $sql);
        mysqli_close($this->conn);
        return $result;
    }

    public function GetList($filters_array = array(), $start = 0, $length = 10, $with_count = false, $is_custom = 0)
	{
        $condition = "";
	    $condition_array = array();

	    $profileid = (isset($filters_array["profileid"]) && !empty($filters_array["profileid"])) ? $filters_array["profileid"] : "";
	    $firstname = (isset($filters_array["firstname"]) && !empty($filters_array["firstname"])) ? $filters_array["firstname"] : "";
	    $middlename = (isset($filters_array["middlename"]) && !empty($filters_array["middlename"])) ? $filters_array["middlename"] : "";
	    $lastname = (isset($filters_array["lastname"]) && !empty($filters_array["lastname"])) ? $filters_array["lastname"] : "";
	    $address = (isset($filters_array["address"]) && !empty($filters_array["address"])) ? $filters_array["address"] : "";
	    $gender = (isset($filters_array["gender"]) && !empty($filters_array["gender"])) ? $filters_array["gender"] : "";
	    $search_filter = (isset($filters_array["search"]["value"]) && !empty($filters_array["search"]["value"])) ? $filters_array["search"]["value"] : "";
		if(empty($search_filter))
	        $search_filter = (isset($filters_array["search_value"]) && $filters_array["search_value"] !== "") ? $filters_array["search_value"] : $search_filter;
	    
	    if(!empty($search_filter))
	    {
	        $sub_condition_array = array();
	        $sub_condition_array[] = " a.firstname like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " a.middlename like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " a.lastname like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " a.address like '%".$this->global_escape_string($search_filter)."%'";
	
	        if(count($sub_condition_array) > 0)
	            $condition_array[] = " ( ".implode(" OR ", $sub_condition_array)." ) ";
	    }

	    if(!empty($profileid))
	        $condition_array[] = " a.profileid = '".$this->global_escape_string($profileid)."'";

	    if(!empty($firstname))
	        $condition_array[] = " a.firstname = '".$this->global_escape_string($firstname)."'";

	    if(!empty($middlename))
	        $condition_array[] = " a.middlename = '".$this->global_escape_string($middlename)."'";
	    
        if(!empty($lastname))
	        $condition_array[] = " a.lastname = '".$this->global_escape_string($lastname)."'";
	    
        if(!empty($address))
	        $condition_array[] = " a.address = '".$this->global_escape_string($address)."'";

	    if(!empty($gender))
	        $condition_array[] = " a.gender = '".$this->global_escape_string($gender)."'";

	    if(count($condition_array) > 0)
	        $condition = " WHERE ".implode(" AND ", $condition_array);

	   $sql = "
	            SELECT
	                a.*
	            FROM
	                ".$this->table_name." as a
	            ".$condition;
	    if($with_count)
	    {
	        $retval = array();
	        #-- get count
	        $count_sql = "SELECT count(*) as total_count from ($sql) foo ";
	        $Result = $this->run_query($count_sql);
	        $ResultSet = $Result;
            $retval["total_count"] = (!empty($ResultSet)?$ResultSet[0]["total_count"]:0);
	        #-- get data based from start and length
	        $data_sql = "$sql limit $length OFFSET $start";
	        $Result =  $this->run_query($data_sql);
	        $ResultSet = $Result;
            // echo"<pre>";print_r($data_sql);die;
	        $retval["data"] = $ResultSet;
	        return $retval;
	    }
	    else
	    {
            $Result =  $this->run_query($sql);
	        $ResultSet = $Result;
	        if(count($ResultSet) > 0)
	        {
	            return $ResultSet;
	        }
	    }
	    return false;
	}


}

?>