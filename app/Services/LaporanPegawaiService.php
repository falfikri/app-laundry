<?php

namespace App\Services;

use Carbon\Carbon;
use App\Repository\TransaksiRepository;

class LaporanPegawaiService
{
    protected $transaksiRepository;

    public function __construct(TransaksiRepository $transaksiRepository) {

        $this->transaksiRepository = $transaksiRepository;
    }

    public function getLaporanPegawai(int $id, $req): array
    {
        dd($req);
        // Validasi start_date dan end_date
        $start_date = $req->start_date ? Carbon::parse($req->start_date)->format('Y-m-d') : null;
        $end_date = $req->end_date ? Carbon::parse($req->end_date)->format('Y-m-d') : null;

        // Jika 'check_semua' bernilai 1, ambil semua riwayat
        if (isset($req->check_semua) && $req->check_semua == 1) {
            $transaksi = $this->transaksiRepository->getRiwayatSemuaInvoice($id);
            $tanggal = "Semua Invoice";
        } else {
            // Jika start_date dan end_date tidak null, ambil riwayat berdasarkan tanggal
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