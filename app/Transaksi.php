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
 */
class Transaksi extends Model
{
    protected $table = 'transaksis';

    // Table Transaksis
    protected $fillable = [
        'id_outlet', 'kd_invoice', 'kd_pelanggan', 'tgl_pemberian', 'tgl_selesai', 'tgl_bayar', 'diskon', 'pajak', 'status', 'ket_bayar', 'kd_pegawai'
    ];

    /**
     * @return BelongsTo
     */
    public function outlet(): BelongsTo
    {
        return $this->belongsTo('App\Outlet', 'id_outlet', 'id');
    }
}
