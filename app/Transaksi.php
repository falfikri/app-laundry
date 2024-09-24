<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @property int id
 * @property int id_outlet
 * @property string kd_invoice
 * @property string kd_pelanggan
 * @property Carbon tgl_pemberian
 * @property Carbon tgl_selesai
 * @property Carbon tgl_bayar
 * @property int diskon
 * @property int pajak
 * @property string status
 * @property string ket_bayar
 * @property string kd_pegawai
 * @property Carbon created_at
 * @property Carbon updated_at
 * @property Outlet outlet
 * @property Pelanggan pelanggan
 * @property User user
 */
class Transaksi extends Model
{
    protected $table = 'transaksis';

    // Table Transaksis
    protected $fillable = [
        'id_outlet', 'kd_invoice', 'pelanggan_id', 'tgl_pemberian', 'tgl_selesai', 'tgl_bayar', 'diskon', 'pajak', 'status', 'ket_bayar', 'kd_pegawai'
    ];

    /**
     * @return BelongsTo
     */
    public function outlet(): BelongsTo
    {
        return $this->belongsTo('App\Outlet', 'id_outlet', 'id');
    }

    /**
     * @return BelongsTo
     */
    public function pelanggan(): BelongsTo
    {
        return $this->belongsTo('App\Pelanggan', 'pelanggan_id', 'id');
    }

    /**
     * @return BelongsTo
     */
    public function user(): BelongsTo 
    {
        return $this->belongsTo('App\User', 'user_id', 'id');
    }
}
