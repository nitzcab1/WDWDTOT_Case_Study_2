<?php

class Country{

    // database connection and table name
    private $conn;
    private $table_name = "countries";

    public $id;
    public $code;
    public $name;

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

    public function GetList($filters_array = array(), $start = 0, $length = 10, $with_count = false, $is_custom = 0)
	{
        $condition = "";
	    $condition_array = array();

	    $id = (isset($filters_array["id"]) && !empty($filters_array["id"])) ? $filters_array["id"] : "";
	    $code = (isset($filters_array["code"]) && !empty($filters_array["code"])) ? $filters_array["code"] : "";
	    $name = (isset($filters_array["name"]) && !empty($filters_array["name"])) ? $filters_array["name"] : "";
	    $search_filter = (isset($filters_array["search"]["value"]) && !empty($filters_array["search"]["value"])) ? $filters_array["search"]["value"] : "";
		if(empty($search_filter))
	        $search_filter = (isset($filters_array["search_value"]) && $filters_array["search_value"] !== "") ? $filters_array["search_value"] : $search_filter;
	    
	    if(!empty($search_filter))
	    {
	        $sub_condition_array = array();
	        $sub_condition_array[] = " a.code like '%".$this->global_escape_string($search_filter)."%'";
	        $sub_condition_array[] = " a.name like '%".$this->global_escape_string($search_filter)."%'";
	
	        if(count($sub_condition_array) > 0)
	            $condition_array[] = " ( ".implode(" OR ", $sub_condition_array)." ) ";
	    }

	    if(!empty($id))
	        $condition_array[] = " a.id = '".$this->global_escape_string($id)."'";

	    if(!empty($code))
	        $condition_array[] = " a.code = '".$this->global_escape_string($code)."'";

	    if(!empty($name))
	        $condition_array[] = " a.name = '".$this->global_escape_string($name)."'";
	    
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