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
        // return [
        //     'title' => $this->faker->sentence(),
        //     'body' => $this->faker->paragraphs(3, true),
        //     'user_id' => rand(1, 10),
        //     'image' => $this->faker->imageUrl(),
        // ];

        return [
            'user_id' => User::inRandomOrder()->first()->id, // ambil user yang sudah ada
            'body' => $this->faker->text(),
            'image' => $this->faker->imageUrl(),
            'like_count' => $this->faker->numberBetween(0, 100),
            'comment_count' => $this->faker->numberBetween(0, 50),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
