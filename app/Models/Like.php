<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Like extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'post_id',
        'comment_id'
    ];

    protected static function booted() {
        static::created(function ($like) {
            if ($like->post_id) {
                $post = Post::find($like->post_id);
                $post->increment('like_count'); // Tambahkan 1
            }
        });

        static::deleted(function ($like) {
            if ($like->post_id) {
                $post = Post::find($like->post_id);
                $post->decrement('like_count'); // Kurangi 1
            }
        });
    }
}
