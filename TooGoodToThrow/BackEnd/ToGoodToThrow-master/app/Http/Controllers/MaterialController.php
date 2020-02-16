<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Material;

class MaterialController extends Controller
{
    public function findAll(){
        $response = array('error_code' => 400, 'error_msg' => '');
        $response = Material::all(['id', 'name']);
        return response()->json($response);
    }

    public function findById($id){
        $response = array('error_code' => 400, 'error_msg' => '');
        $response = Material::find($id)->first(['id', 'name']);
        return response()->json($response);
    }
}
