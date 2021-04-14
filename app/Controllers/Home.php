<?php namespace App\Controllers;

use App\Models\IndexModel;

class Home extends BaseController
{
	public function index()
	{
        if ($this->request->getMethod() == 'post') {
            $input = [
                'username' => $this->request->getPost('username'),
                'password' => $this->request->getPost('password')
            ];

			$indexModel = new IndexModel();
			$result = $indexModel->getUser($input['username']);
			// print_r($result);
			// die;
			if (password_verify($input['password'], $result['password'])) {
				$userLogIn = [
					'loggedin' => true,
					'team_id' => $result['team_id'],
					'team_name' => $result['team_name']
				];
				$this->session->set($userLogIn);
				return redirect()->to('/');
			} else {
				return redirect()->to('/');
			}
		} else {
			if (!session('loggedin')) {
				return view('login');
			} else {
				return redirect()->to('/dashboard');
			}
		}
	}

	public function dashboard()
	{
		if (!session('loggedin')) {
			return view('login');
		} else {
			$data = [
				'team_name' => session('team_name')
			];
			return view('dashboard', $data);
		}
	}

	public function profile()
	{
		if (!session('loggedin')) {
			return view('login');
		} else {
			$indexModel = new IndexModel();
			$teamStatus = $indexModel->getStatus(session('team_id'));
			$teamHeader = $indexModel->getTeamInfo(session('team_id'));
			$teamMember = $indexModel->getMemberTeam(session('team_id'));
			$data = [
				'team_header' => $teamHeader,
				'team_member' => $teamMember,
				'status' => $teamStatus,
			];

			// echo session('team_id');
			// print_r($teamMember);
			// die;
			return view('profile', $data);
		}
	}

	public function penyisihan()
	{
		$indexModel = new IndexModel();
		$teamStatus = $indexModel->getStatus(session('team_id'));
		if (!session('loggedin')) {
			return view('login');
		} else if($teamStatus){
			return redirect()->to('/profile');
		}else {
			$data = [
				'team_name' => session('team_name'),
				'team_id' => session('team_id')
			];
			return view('index', $data);
		}
	}

	public function submitPaper()
	{
        if ($this->request->getMethod() == 'post') {
            $input = [
                'team_id' => $this->request->getPost('team_id'),
                'answer' => $this->request->getPost('answer')
            ];

			$indexModel = new IndexModel();
			$result = $indexModel->submitAnswer($input);
			return redirect()->to('/profile');
		} 
	}

	public function logout()
	{
        $this->session->destroy();
		return redirect()->to('/');
	}

	//--------------------------------------------------------------------

}
