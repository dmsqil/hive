<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name'=> 'user',
            'email' => 'user@u.u',
            'password'=> Hash::make('123456')
        ]);

        User::factory()->count(10)->create();
    }
}
