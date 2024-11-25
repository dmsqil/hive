<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;

class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name(), // Generates a fake name
            'email' => $this->faker->unique()->safeEmail(), // Generates a unique email
            'password' => Hash::make('password'), // Sets a default hashed password
            'bio' => $this->faker->sentence(), // Generates a short bio
            'image' => null, // Keeps the profile picture empty by default
            'is_verified' => $this->faker->boolean(20), // 20% chance of being verified
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
