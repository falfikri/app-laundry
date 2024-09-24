<?php

namespace App\Services;

use App\Repository\LaporanPegawaiRepository;

class LaporanPegawaiService
{
    protected $laporanPegawaiRepository;

    public function __construct(LaporanPegawaiRepository $laporanPegawaiRepository)
    {
        $this->laporanPegawaiRepository = $laporanPegawaiRepository;
    }

    
    public function getLaporanPegawai()
    {
        return $this->laporanPegawaiRepository->getLaporanPegawai();
    }
}