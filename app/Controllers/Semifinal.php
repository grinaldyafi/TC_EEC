<?php namespace App\Controllers;


class Semifinal extends BaseController
{
	public function index()
	{
		if (!session('loggedin')) {
			return view('login');
		} else {
			return view('semifinal/lab');
		}
	}

	public function question()
	{
		if (!session('loggedin')) {
			return view('login');
		} else {
			return view('semifinal/question');
		}
	}

}
