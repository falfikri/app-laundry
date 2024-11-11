<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Paket_kilo;

class PaketKiloSeeder extends Seeder
{
    private function getPaketKiloan(): array
    {
        return [
            [
                "kd_paket"    => "PK001",
                "nama_paket"  => "Pakaian",
                "harga_paket"     => 6000,
                "hari_paket"      => 2,
                "min_berat_paket" => 1,
                "antar_jemput_paket" => 1,
                "id_outlet" => 1
            ],
            [
                "kd_paket"    => "PK002",
                "nama_paket"  => "Karpet",
                "harga_paket"     => 12000,
                "hari_paket"      => 3,
                "min_berat_paket" => 1,
                "antar_jemput_paket" => 0,
                "id_outlet" => 1
            ],
        ];
    }

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        foreach ($this->getPaketKiloan as $paketKiloan) {
            \App\Paket_kiloan::query()->create($paketKiloan);
        }
    }
}
