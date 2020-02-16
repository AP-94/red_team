<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Objects;
use App\ObjectToReuse;
use App\Material;
use Illuminate\Support\Facades\Input;

class ObjectController extends Controller
{
    public function findByObjects($id){
        $response = array('error_code' => 400, 'error_msg' => 'Error inserting info');
        $response = Objects::where('object_to_reuses_id', $id)->get();
        return response() -> json($response);
    }

    public function findByMaterial($id){
        $response = array('error_code' => 400, 'error_msg' => 'Error inserting info');
        $response = Objects::where('material_id', $id)->get();
        return response() -> json($response);
    }

    public function findForAll(Request $req){
        $response = array('error_code' => 400, 'error_msg' => 'Error inserting info');
        if(!empty($req->name)){
            $object_id = Material::where('name', strtolower($req->name))->first(['id']);
            if(!empty($object_id)){
                $object = Objects::where('material_id', $object_id->id)->get(['id','name','material_id','object_to_reuses_id','img','link_video','tools','explain','skill']);
                return response() -> json($object);
            }
            else{
                $object_id = ObjectToReuse::where('name', strtolower($req->name))->first(['id']);
                if(!empty($object_id)){
                    $object = Objects::where('object_to_reuses_id', $object_id->id)->get(['id','name','material_id','object_to_reuses_id','img','link_video','tools','explain','skill']);
                    return response() -> json($object);
                }else{
                    $object = Objects::where('name', strtolower($req->name))->get(['id','name','material_id','object_to_reuses_id','img','link_video','tools','explain','skill']);
                    if(!empty($object)){
                        return response() -> json($object);
                    }
                }
            }
        }
        return response() -> json($response);
    }

    public function listAllObjects(){
        $response = Objects::all(['id','name','material_id','object_to_reuses_id','img','link_video','tools','explain','skill']);
        return response()->json($response);
    }

    public function listForSkill(Request $req){
        $response = array('error_code' => 400, 'error_msg' => '');
        if(!empty($req->skill)){
            $response = Objects::where('skill', $req->skill)->get(['id','name','material_id','object_to_reuses_id','img','link_video','tools','explain','skill']);
        }
        return response()->json($response);
    }

    public function findById($id){
        $response = array('error_code' => 400, 'error_msg' => 'Error inserting info');
        $response = Objects::where('id', $id)->first(['id','name','material_id','object_to_reuses_id','img','link_video','tools','explain','skill']);
        return response() -> json($response);
    }
}
