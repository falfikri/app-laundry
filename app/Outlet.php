<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * @property int id
 * @property string nama
 * @property string alamat
 * @property string hotline
 * @property string email
 * @property string iframe_script
 * @property Carbon created_at
 * @property Carbon updated_at
 * @property Transaksi[] transaksi
 */
class Outlet extends Model
{
    protected $table = 'outlets';

    // Table Outlets
    protected $fillable = [
        'nama', 'alamat', 'hotline', 'email', 'iframe_script'
    ];

    /**
     * @return HasMany
     */
    public function transaksi(): HasMany
    {
        return $this->hasMany('App\Transaksi', 'outlet_id', 'id');
    }
}
