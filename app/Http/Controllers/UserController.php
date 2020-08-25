<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;

class UserController extends Controller

{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function config() {
        return view('user.config');     
        
    }
    
    public function update(Request $request) {
        
        
 
        // conseguir al usuario identificado
        $user = \Auth::user();
        $id = \Auth::user()->id;
        
        //validacion del formulario
        $validate = $this->validate($request, [
            'name' => ['required', 'string', 'max:255'],
            'surname' => ['required', 'string', 'max:255'],
            'nick' => ['required', 'string', 'max:255', 'unique:users,nick,'.$id],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email,'.$id]
        ]);
        
        // recoger los datosdel formulario     
        $name = $request->input('name');
        $surname = $request->input('surname');
        $nick = $request->input('nick');
        $email = $request->input('email');
        
        // asignar valores al objeto usuario
        $user->name = $name;
        $user->surname = $surname;
        $user->nick = $nick;
        $user->email = $email;
        
        // subir la imagen
        $image_path = $request->file('image');
        if($image_path) {
            $image_path_name = time().$image_path->getClientOriginalName();
        
            //Guardarla en la carpeta Storage/app/user
            Storage::disk('users')->put($image_path_name, File::get($image_path));
            
            // Le doy un valor al nombre de la imagen
            $user->image = $image_path_name;
        }
        
        
        
        $user->update();
        
        return redirect()-> route('config')->with(['message' => 'Usuario Actualizado Correctamente']);
           
    }
    
    public function getImage($filename) {
        $file = Storage::disk('users')->get($filename);
        return new Response($file, 200);
    }
    
}
