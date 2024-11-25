<?php

namespace Database\Factories;

use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class CommentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'post_id' => Post::inRandomOrder()->first()->id, // Menghubungkan ke post yang sudah ada 
            'user_id' => User::inRandomOrder()->first()->id, // Menghubungkan ke user yang sudah ada 
            'content' => $this->faker->paragraph(),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
