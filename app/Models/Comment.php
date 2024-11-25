<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Comment extends Model
{
    use HasFactory;

    protected $fillable = [
        'post_id',
        'user_id',
        'content'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    protected static function booted() {
        static::created(function ($comment) {
            $post = Post::find($comment->post_id);
            $post->increment('comment_count'); // Tambahkan 1
        });

        static::deleted(function ($comment) {
            $post = Post::find($comment->post_id);
            $post->decrement('comment_count'); // Kurangi 1
        });
    }
}
