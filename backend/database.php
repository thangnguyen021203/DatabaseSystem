<?php

class Database
{
    private $mysqli;

    public function __construct($host, $user, $password, $database)
    {
        $this->mysqli = new mysqli($host, $user, $password, $database);

        if ($this->mysqli->connect_error) {
            $this->handleError('Connection failed: ' . $this->mysqli->connect_error);
        }
    }
    public function getConnection()
    {
        if (!$this->mysqli->ping()) {
            $this->handleError('Connection lost.');
        }

        return $this->mysqli;
    }

    public function query($sql)
    {
        $result = $this->mysqli->query($sql);

        if ($this->mysqli->errno) {
            $this->handleError('Query execution failed: ' . $this->mysqli->error);
        }

        return $result;

    }

    private function handleError($message)
    {
        echo json_encode(['error' => $message]);
        exit();
    }

    public function __destruct()
    {
        mysqli_close($this->mysqli);
    }
}
?>