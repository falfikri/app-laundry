<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * @property int id
 * @property string kd_pelanggan
 * @property string nama_pelanggan
 * @property string jk_pelanggan
 * @property string email_pelanggan
 * @property string no_hp_pelanggan
 * @property string alamat_pelanggan
 * @property Carbon created_at
 * @property Carbon updated_at
 * @property Transaksi[] transaksi
 */

class Pelanggan extends Model
{
    protected $table = 'pelanggans';

    // Table Pelanggans
    protected $fillable = [
        'kd_pelanggan', 'nama_pelanggan', 'jk_pelanggan', 'email_pelanggan', 'no_hp_pelanggan', 'alamat_pelanggan'
    ];

    /**
     * @return HasMany
     */
    public function transaksi(): HasMany
    {
        return $this->hasMany('App\Transaksi', 'pelanggan_id', 'id');
    }
}
