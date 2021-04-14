<?php

namespace App\Models;

use CodeIgniter\Model;

class IndexModel extends Model
{
    protected $table      = 'users';
    protected $primaryKey = 'id';

    protected $allowedFields = [
        'name', 'email', 'password', 'asal_kampus', 'image', 'role_id', 'is_active', 'created_at', 'updated_at'
    ];

    public function getUser($username)
    {
        $db = db_connect();
        $queryUserToken = "SELECT *, team.id as team_id FROM users,
                                         team
                                   WHERE team.team_name = ? 
                                     AND users.id = team.user_id 
                                     AND team.lomba_id = 4
                                   LIMIT 1";
        $query = $db->query($queryUserToken, $username);
        $result = $query->getRowArray();
        return $result;
    }

    public function getTeamInfo($id)
    {
        $db = db_connect();
        $queryUserToken = "SELECT * FROM team, users
                                   WHERE team.id = ?
                                     AND team.user_id = users.id 
                                     AND team.lomba_id = 4
                                   LIMIT 1";
        $query = $db->query($queryUserToken, $id);
        $result = $query->getRowArray();
        return $result;
    }

    public function getStatus($id){
        $db = db_connect();
        $queryUserToken = "SELECT * FROM eec_answer ea
                                   WHERE ea.team_id = ?
                                   LIMIT 1";
        $query = $db->query($queryUserToken, $id);
        $result = $query->getRowArray();
        return $result;
    }

    public function getMemberTeam($id)
    {
        $db = db_connect();
        $queryUserToken = "SELECT * FROM member_team
                                   WHERE team_id = ?";
        $query = $db->query($queryUserToken, $id);
        $result = $query->getResultArray();
        return $result;
    }

    public function submitAnswer($data)
    {
        $db = db_connect();

        $queryTeam = "insert into eec_answer(team_id,answer,time) values (?,?,NOW())";
        $query = $db->query($queryTeam, [$data['team_id'], $data['answer']]);
        
        return $db->error();
    }

}
