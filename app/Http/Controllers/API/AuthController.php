<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
// use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{

    public function register(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Ada Kesalahan',
                'data' => $validator->errors()
            ], 422);
        }

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);

        // $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'user' => $user,
            'token' => $user->createToken('auth_token')->plainTextToken
        ], 201);
    }

    public function login(Request $request)
    {
        // Try to validate the input
        $attrs = $request->validate([
                'email' => 'required|email',
                'password' => 'required',
            ]);

        // Attempt to log the user in
        if (!Auth::attempt($attrs)) {
            return response()->json([
                'message' => 'Invalid login credentials'
            ], 403);
        }

        // return user & token in response
        return response([
            'message' => 'Login successful',
            'user' => Auth::user(),
            'token' => Auth::user()->createToken('auth_token')->plainTextToken
        ], 200);
    }

    public function logout() {
        Auth::user()->tokens()->delete();
        return response([
            'message' => 'Logout successful'
        ],200);
    } 

    // get auth user detail 
    public function user() {
        return response([
            'user' => Auth::user()
        ],200);
    }

    // update auth user
    public function update(Request $request) {
        $attrs = $request->validate([
            'name' => 'required|string',
        ]);

        $image = $this->saveImage($request->image, 'users');
        
        Auth::user()->update([
            'name' => $attrs['name'],
            'image' => $image
        ]);

        return response([
            'message' => 'User updated',
            'user' => Auth::user()
        ], 200);
    }
}
