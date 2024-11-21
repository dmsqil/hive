<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $table->id();
        //     $table->string('name');
        //     $table->string('email')->unique();
        //     $table->string('image')->nullable();
        //     $table->timestamp('email_verified_at')->nullable();
        //     $table->string('password');
        //     $table->rememberToken();
        //     $table->timestamps();
        User::create([
            'name'=> 'user',
            'email' => 'user@u.u',
            'password'=> Hash::make('123456')
        ]);
    }
}
