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
            'image' => 'https://cdn0-production-images-kly.akamaized.net/AwEA4f95P32p5tToO6yPl_bmw4w=/800x1066/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1206778/original/091788000_1460967229-ad159740326pictured-the-v.jpg',
            'like_count' => 0,
            'comment_count' => 0,
            'created_at' => now(),
            'updated_at' => now()
        ]);

        Post::create([
            'user_id' => 1,
            'body' => 'First post',
            'image' => 'https://cdn0-production-images-kly.akamaized.net/AwEA4f95P32p5tToO6yPl_bmw4w=/800x1066/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1206778/original/091788000_1460967229-ad159740326pictured-the-v.jpg',
            'like_count' => 0,
            'comment_count' => 0,
            'created_at' => now(),
            'updated_at' => now()
        ]);

        Post::factory(10)->create();
    }
}
