<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Comment;

class CommentController extends Controller
{
    // get all comments of a post
    public function index($id)
    {
        $post = Post::find($id);

        if(!$post)
        {
            return response([
                'message' => 'Post not found.'
            ], 403);
        }

        return response([
            'comments' => $post->comments()->with('user:id,name,image')->get()
        ], 200);
    }

    // create a comment
    public function store(Request $request, $id)
    {
        $post = Post::find($id);

        if(!$post)
        {
            return response([
                'message' => 'Post not found.'
            ], 403);
        }

        //validate fields
        $attrs = $request->validate([
            'content' => 'required|string'
        ]);

        Comment::create([
            'content' => $attrs['content'],
            'post_id' => $id,
            'user_id' => auth()->user()->id
        ]);

        return response([
            'message' => 'Comment created.',
            'comment' => Comment::with('user:id,name,image')->latest()->first()
        ], 200);
    }

    // update a comment
    public function update(Request $request, $id)
    {
        $comment = Comment::find($id);

        if(!$comment)
        {
            return response([
                'message' => 'Comment not found.'
            ], 403);
        }

        if($comment->user_id != auth()->user()->id)
        {
            return response([
                'message' => 'Permission denied.'
            ], 403);
        }

        //validate fields
        $attrs = $request->validate([
            'content' => 'required|string'
        ]);

        $comment->update([
            'content' => $attrs['content']
        ]);

        return response([
            'message' => 'Comment updated.',
            'comment' => Comment::with('user:id,name,image')->find($id)
        ], 200);
    }

    // delete a comment
    public function destroy($id)
    {
        $comment = Comment::find($id);

        if(!$comment)
        {
            return response([
                'message' => 'Comment not found.'
            ], 403);
        }

        if($comment->user_id != auth()->user()->id)
        {
            return response([
                'message' => 'Permission denied.'
            ], 403);
        }
        $logData = $comment;

        $comment->delete();

        return response([
            'message' => 'Comment deleted.',
            'comment' => $logData
        ], 200);
    }
}
