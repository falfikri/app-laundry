<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class OutletSeeder extends Seeder
{
    private function getOutlet(): array
    {
        return [
            [
                "nama" => "Outlet 1",
                "alamat" => "Batu 8",
                "hotline" => "08",
                "email" => "testing@example.com",
                "iframe_script" => ""
            ],
            [
                "nama" => "Outlet 2",
                "alamat" => "Batu 7",
                "hotline" => "08",
                "email" => "testing@example.com",
                "iframe_script" => ""
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
        foreach ($this->getOutlet as $outlet) {
            \App\Outlet::query()->create($outlet);
        }
    }
}
