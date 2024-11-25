<?php

namespace Database\Seeders;

use App\Models\Post;
use Illuminate\Database\Seeder;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Post::create([
            'user_id' => 1,
            'body' => 'First post',
            'image' => 'posts/1.jpg',
            'like_count' => 0,
            'comment_count' => 0,
            'created_at' => now(),
            'updated_at' => now()
        ]);

        Post::factory(10)->create();
    }
}
