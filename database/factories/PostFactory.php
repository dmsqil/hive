<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'user_id' => User::inRandomOrder()->first()->id, // ambil user yang sudah ada
            'body' => $this->faker->text(),
            'image' => $this->faker->imageUrl(),
            'like_count' => 0,
            'comment_count' => 0,
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
