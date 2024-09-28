<?php

namespace App\Jobs\Laporan;

use Illuminate\Bus\Queueable;
use Carbon\Carbon;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use App\Services\LaporanPegawaiService;
use Illuminate\Support\Facades\Storage;

class LaporanPegawaiJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $id;
    protected $requestedData;

    public function __construct(int $id, array $requestedData)
    {
        $this->id = $id;
        $this->requestedData = $requestedData;
    }

    public function handle(LaporanPegawaiService $laporanPegawaiService): void
    {
        // Konversi requestedData menjadi instance Request
        $request = new Request($this->requestedData);

        // Mengambil data laporan dari service
        $laporanData = $laporanPegawaiService->getLaporanPegawai($this->id, $request);

        if ($laporanData['success']) {
            // Generate PDF dengan data yang didapat dari service
            $pdf = Pdf::loadView('halaman_laporan.pdf_laporan_pegawai', [
                'transaksi'   => $laporanData['transaksi'],
                'tanggal'     => $laporanData['tanggal'],
                'start_date2' => $laporanData['start_date2'],
                'end_date2'   => $laporanData['end_date2']
            ])->output();

            // Mendapatkan bulan saat ini atau dari laporan
            $bulan = Carbon::now()->format('F_Y'); // Format bulan dan tahun, contoh: September_2024

            // Tentukan path relatif di folder 'pdf' di storage/public
            $filePath = 'pdf/laporan_' . $this->id . '_' . $bulan . '.pdf';

            // Simpan file PDF di disk 'public' (storage/app/public/pdf/)
            Storage::disk('public')->put($filePath, $pdf);
        }
    }
}
