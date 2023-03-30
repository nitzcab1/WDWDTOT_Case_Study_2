<?php

class Survey{

    // database connection and table name
    private $conn;
    private $table_name = "survey";

    public $id;
    public $name;
    public $gender;
    public $age;
    public $mobile;
    public $body_temp;
    public $diagnosed;
    public $encounter;
    public $vacinated;
    public $country_id;
    public $date_created;
    public $date_updated;

    public function __construct($db)
    {
        $this->conn = $db;
    }
    // this is alternative function for sanitizing the string
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
        $statement = $this->conn->prepare("INSERT INTO " . $this->table_name . " (name, gender, age, mobile, body_temp, diagnosed, encounter, vacinated, country_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $statement->bind_param("sssssssss",$this->name,$this->gender,$this->age,$this->mobile,$this->body_temp,$this->diagnosed,$this->encounter,$this->vacinated,$this->country_id);

        //sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->gender=htmlspecialchars(strip_tags($this->gender));
        $this->age=htmlspecialchars(strip_tags($this->age));
        $this->mobile=htmlspecialchars(strip_tags($this->mobile));
        $this->body_temp=htmlspecialchars(strip_tags($this->body_temp));
        $this->diagnosed=htmlspecialchars(strip_tags($this->diagnosed));
        $this->encounter=htmlspecialchars(strip_tags($this->encounter));
        $this->vacinated=htmlspecialchars(strip_tags($this->vacinated));
        $this->country_id=htmlspecialchars(strip_tags($this->country_id));

        if($statement->execute()){
            $statement->close();
            return true;
        }

        echo ("Error: " . $this->conn->error);
        return false;
    }

    public function update(){
        $statement = $this->conn->prepare("UPDATE " . $this->table_name . " SET name = ?, gender = ?, age = ?, mobile = ?, body_temp = ?, diagnosed = ?, encounter = ?, vacinated = ?, country_id = ? WHERE id = " . $this->id . "");
        $statement->bind_param("sssssssss",$this->name,$this->gender,$this->age,$this->mobile,$this->body_temp,$this->diagnosed,$this->encounter,$this->vacinated,$this->country_id);

        //sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->gender=htmlspecialchars(strip_tags($this->gender));
        $this->age=htmlspecialchars(strip_tags($this->age));
        $this->mobile=htmlspecialchars(strip_tags($this->mobile));
        $this->body_temp=htmlspecialchars(strip_tags($this->body_temp));
        $this->diagnosed=htmlspecialchars(strip_tags($this->diagnosed));
        $this->encounter=htmlspecialchars(strip_tags($this->encounter));
        $this->vacinated=htmlspecialchars(strip_tags($this->vacinated));
        $this->country_id=htmlspecialchars(strip_tags($this->country_id));

        if($statement->execute()){
            $statement->close();
            return true;
        }

        echo ("Error: " . $this->conn->error);
        return false;
    }

    public function delete(){
        $statement = $this->conn->prepare("DELETE FROM " . $this->table_name . " WHERE id = " . $this->id);

        if($statement->execute()){
            $statement->close();
            return true;
        }

        echo ("Error: " . $this->conn->error);
        return false;
    }

    public function getdashboarddata() {
        $all = "SELECT COUNT(*) AS count FROM " . $this->table_name."";
        $minors = "SELECT COUNT(*) AS count FROM " . $this->table_name." WHERE age BETWEEN 1 and 17";
        $adults = "SELECT COUNT(*) AS count FROM " . $this->table_name." WHERE age > 17";
        $fever = "SELECT COUNT(*) AS count FROM " . $this->table_name." WHERE body_temp > 37.2";
        $encounter = "SELECT COUNT(*) AS count FROM " . $this->table_name." WHERE encounter = 1";
        $vacinated = "SELECT COUNT(*) AS count FROM " . $this->table_name." WHERE vacinated = 1";
        $foreigner = "SELECT COUNT(*) AS count FROM " . $this->table_name." WHERE country_id <> 174";
        $all_result = $this->run_query($all);
        $minors_result = $this->run_query($minors);
        $adults_result = $this->run_query($adults);
        $fever_result = $this->run_query($fever);
        $encounter_result = $this->run_query($encounter);
        $vacinated_result = $this->run_query($vacinated);
        $foreigner_result = $this->run_query($foreigner);
        $results = array();
        $results["all"] = ($all_result? $all_result:[]);
        $results["minors"] = ($minors_result? $minors_result:[]);
        $results["adults"] = ($adults_result? $adults_result:[]);
        $results["fever"] = ($fever_result? $fever_result:[]);
        $results["encounter"] = ($encounter_result? $encounter_result:[]);
        $results["vacinated"] = ($vacinated_result? $vacinated_result:[]);
        $results["foreigner"] = ($foreigner_result? $foreigner_result:[]);
        return $results;
    }

    public function GetList($filters_array = array(), $start = 0, $length = 10, $with_count = false, $is_custom = 0)
	{
        $condition = "";
	    $condition_array = array();

	    $id = (isset($filters_array["id"]) && !empty($filters_array["id"])) ? $filters_array["id"] : "";
	    $name = (isset($filters_array["name"]) && !empty($filters_array["name"])) ? $filters_array["name"] : "";
	    $gender = (isset($filters_array["gender"]) && !empty($filters_array["gender"])) ? $filters_array["gender"] : "";
	    $mobile = (isset($filters_array["mobile"]) && !empty($filters_array["mobile"])) ? $filters_array["mobile"] : "";
	    $body_temp = (isset($filters_array["body_temp"]) && !empty($filters_array["body_temp"])) ? $filters_array["body_temp"] : "";
	    $diagnosed = (isset($filters_array["diagnosed"]) && !empty($filters_array["diagnosed"])) ? $filters_array["diagnosed"] : "";
	    $encounter = (isset($filters_array["encounter"]) && !empty($filters_array["encounter"])) ? $filters_array["encounter"] : "";
	    $vacinated = (isset($filters_array["vacinated"]) && !empty($filters_array["vacinated"])) ? $filters_array["vacinated"] : "";
	    $country_id = (isset($filters_array["country_id"]) && !empty($filters_array["country_id"])) ? $filters_array["country_id"] : "";
	    $date_created = (isset($filters_array["date_created"]) && !empty($filters_array["date_created"])) ? $filters_array["date_created"] : "";
	    $date_updated = (isset($filters_array["date_updated"]) && !empty($filters_array["date_updated"])) ? $filters_array["date_updated"] : "";
	    $search_filter = (isset($filters_array["search"]["value"]) && !empty($filters_array["search"]["value"])) ? $filters_array["search"]["value"] : "";
		if(empty($search_filter))
	        $search_filter = (isset($filters_array["search_value"]) && $filters_array["search_value"] !== "") ? $filters_array["search_value"] : $search_filter;
	    
	    if(!empty($search_filter))
	    {
	        $sub_condition_array = array();
	        $sub_condition_array[] = " a.name like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " a.gender like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " a.mobile like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " a.body_temp like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " a.diagnosed like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " a.encounter like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " a.vacinated like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " a.date_created like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " b.name like '%".$this->global_escape_string($search_filter)."%'";
	
	        if(count($sub_condition_array) > 0)
	            $condition_array[] = " ( ".implode(" OR ", $sub_condition_array)." ) ";
	    }

	    if(!empty($id))
	        $condition_array[] = " a.id = '".$this->global_escape_string($id)."'";

	    if(!empty($name))
	        $condition_array[] = " a.name = '".$this->global_escape_string($name)."'";

	    if(!empty($gender))
	        $condition_array[] = " a.gender = '".$this->global_escape_string($gender)."'";
	    
        if(!empty($mobile))
	        $condition_array[] = " a.mobile = '".$this->global_escape_string($mobile)."'";
	    
        if(!empty($body_temp))
	        $condition_array[] = " a.body_temp = '".$this->global_escape_string($body_temp)."'";

	    if(!empty($diagnosed))
	        $condition_array[] = " a.diagnosed = '".$this->global_escape_string($diagnosed)."'";

	    if(!empty($encounter))
	        $condition_array[] = " a.encounter = '".$this->global_escape_string($encounter)."'";

	    if(!empty($vacinated))
	        $condition_array[] = " a.vacinated = '".$this->global_escape_string($vacinated)."'";

	    if(!empty($country_id))
	        $condition_array[] = " a.country_id = '".$this->global_escape_string($country_id)."'";

	    if(!empty($date_created))
	        $condition_array[] = " a.date_created = '".$this->global_escape_string($date_created)."'";

	    if(!empty($date_updated))
	        $condition_array[] = " a.date_updated = '".$this->global_escape_string($date_updated)."'";

	    if(count($condition_array) > 0)
	        $condition = " WHERE ".implode(" AND ", $condition_array);

	   $sql = "
	            SELECT
	                a.*,
                    b.name as 'country_name'
	            FROM
	                ".$this->table_name." as a
                    left join countries as b on a.country_id = b.id
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