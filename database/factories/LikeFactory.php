<?php

namespace Database\Factories;

use App\Models\Comment;
use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class LikeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'user_id' => User::inRandomOrder()->first()->id, // Menghubungkan ke user yang sudah ada 
            'post_id' => $this->faker->boolean() ? Post::inRandomOrder()->first()->id : null, // Menghubungkan ke post yang sudah ada, atau null 
            'comment_id' => $this->faker->boolean() ? Comment::inRandomOrder()->first()->id : null, // Menghubungkan ke comment yang sudah ada, atau null 
            'created_at' => now(),
            'updated_at' => now()
        ];
    }
}
