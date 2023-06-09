<?php

namespace Application\Model;

use Application\Utils\Database;
use System\Core\Model;

/**
 * UserModel Class
 *
 * @version 0.0.1
 */
class UserModel
{
  protected $username;
  protected $password;
  protected $database;
  protected $tableName = 'users';

  function __construct()
  {
    $this->database = new Database($this->tableName);
  }

  public function setUsername(string $username = null)
  {
    $this->username = $username;
  }

  public function getUsername()
  {
    return $this->username;
  }


  public function setPassword(string $password = null)
  {
    $this->password = md5($password);
  }

  public function getPassword()
  {
    return $this->password;
  }

  public function Login()
  {
    $this->createFirstUserIfNeed();
    $sql = sprintf("SELECT * FROM %s WHERE username = :0 AND password = :1", $this->tableName);
    $rows = $this->database->executeSql(['sql' => $sql, 'params' => [$this->username, $this->password]], true, true);
    return count($rows) > 0;
  }

  public function createFirstUserIfNeed()
  {
    $sql = sprintf("SELECT * FROM %s", $this->tableName);
    $rows = $this->database->executeSql(['sql' => $sql], true, false);
    if (count($rows) <= 0) {
      $firstPass = "3899dcbab79f92af727c2190bbd8abc5";
      $sql = sprintf("INSERT INTO %s (username, password, active)  VALUES ('kabum', '%s', 1)", $this->tableName, $firstPass);
      $this->database->executeSql(['sql' => $sql, 'rowCount' => true], true, false);
    }
  }
}