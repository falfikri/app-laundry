<?php

namespace App\Jobs\Laporan;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Services\LaporanPegawaiService;


class LaporanPegawaiJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $id;
    protected $requestedData;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(int $id, array $requestedData)
    {
        $this->id = $id;
        $this->requestedData = $requestedData;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle(LaporanPegawaiService $laporanPegawaiService)
    {
        // Mengambil data laporan dari service
        $laporanData = $laporanPegawaiService->getLaporanPegawai($this->id, (object) $this->requestedData);

        if ($laporanData['success']) {
            // Generate PDF dengan data yang didapat dari service
            $pdf = Pdf::loadView('halaman_laporan.pdf_laporan_pegawai', [
                'transaksi'   => $laporanData['transaksi'],
                'tanggal'     => $laporanData['tanggal'],
                'start_date2' => $laporanData['start_date2'],
                'end_date2'   => $laporanData['end_date2']
            ]);

            // Simpan file PDF di storage
            $filePath = storage_path('app/public/pdf/laporan_' . $this->id . '.pdf');
            $pdf->save($filePath);
        }
    }
}
