<?php 

namespace App\Validation;
use App\Models\UserModel;

class MyRules
{

    public function check_email($str, &$error)
    {
        $userModel = new UserModel();
        $result = $userModel->getUserByEmail($_POST['email']);
        if (!$result)
        {
            $error = 'Email tidak terdaftar';
            return FALSE;
        }else{
            return TRUE;
        }
    }

}