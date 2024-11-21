<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name'); // Equivalent to `username tinytext NOT NULL`
            $table->string('email'); // Equivalent to `email tinytext NOT NULL`
            $table->string('password'); // Equivalent to `password tinytext NOT NULL`
            $table->text('bio')->nullable(); // Equivalent to `bio text NOT NULL`
            $table->binary('profile_pictures')->nullable(); // Equivalent to `profile_pictures blob NOT NULL`
            $table->boolean('is_verified')->default(0); // Equivalent to `is_verified enum('Y', 'N') NOT NULL
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
