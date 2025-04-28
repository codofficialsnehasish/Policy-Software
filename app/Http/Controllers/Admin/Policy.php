<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

use App\Models\User; 

class Policy extends Controller
{
    public function index(){
        $data['title'] = 'Policy';
        $data['policy'] = [];
        return view("admin/policy/content")->with($data);
    }

    public function add(){
        $data['title'] = 'Policy';
        $data['policy'] = [];
        return view("admin/policy/add")->with($data);
    }
}