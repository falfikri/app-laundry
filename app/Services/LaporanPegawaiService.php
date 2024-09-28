<?php

namespace App\Services;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Repository\TransaksiRepository;

class LaporanPegawaiService
{
    protected $transaksiRepository;

    public function __construct(TransaksiRepository $transaksiRepository) {

        $this->transaksiRepository = $transaksiRepository;
    }

    public function getLaporanPegawai(int $id, Request $request): array
    {
        // Validasi start_date dan end_date
        $start_date = $request->input('start_date') ? Carbon::parse($request->input('start_date'))->format('Y-m-d') : null;
        $end_date = $request->input('end_date') ? Carbon::parse($request->input('end_date'))->format('Y-m-d') : null;

        // Jika 'check_semua' bernilai 1, ambil semua riwayat
        if ($request->input('check_semua') == 1) {
            $transaksi = $this->transaksiRepository->getRiwayatSemuaInvoice($id);
            $tanggal = "Semua Invoice";
        } else {
            if ($start_date && $end_date) {
                $transaksi = $this->transaksiRepository->getRiwayatByDateRange($id, $start_date, $end_date);
            } else {
                $transaksi = collect([]); // Jika tanggal tidak ada, kembalikan koleksi kosong
            }
            $tanggal = "";
        }

        return [
            "success" => true,
            "transaksi" => $transaksi,
            "tanggal" => $tanggal,
            "start_date2" => $start_date,
            "end_date2" => $end_date
        ];
    }
}