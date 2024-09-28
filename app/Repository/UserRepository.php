<?php

namespace App\Repository;

use App\User;

class UserRepository
{
    public static function getUserById(int $id)
    {
        return User::query()
        ->where('id', $id)
        ->first();
    }
}