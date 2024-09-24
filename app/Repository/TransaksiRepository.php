<?php

namespace App\Repository;

use App\Transaksi;
use Illuminate\Database\Eloquent\Collection;

class TransaksiRepository
{
    public static function getRiwayatSemuaInvoice(int $userId): Collection
    {
        return Transaksi::query()
            ->with([
                'outlet:nama',
                'pelanggan:nama_pelanggan'
            ])
            ->where('user_id', $userId)
            ->orderBy('tgl_pemberian', 'desc')
            ->get();
    }

    public static function getRiwayatByDateRange(int $userId, $start_date, $end_date): Collection
    {
        return Transaksi::query()
            ->with([
                'user:id,kd_pengguna,name',
                'outlet:id,nama',
                'pelanggan:kd_pelanggan,nama_pelanggan'
            ])
            ->where('user_id', $userId)
            ->whereBetween('tgl_pemberian', [$start_date, $end_date])
            ->orderBy('tgl_pemberian', 'desc')
            ->get();
    }
}