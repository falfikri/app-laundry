<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransaksiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaksis', function (Blueprint $table) {
            $table->id();
            $table->foreignId('outlet_id')
            ->constrained('outlets')
            ->cascadeOnUpdate()
            ->cascadeOnDelete();
            $table->string('kd_invoice');
            // $table->string('kd_pelanggan');
            $table->foreignId('pelanggan_id')
            ->constrained('pelanggans')
            ->cascadeOnUpdate()
            ->cascadeOnDelete();
            $table->date('tgl_pemberian');
            $table->date('tgl_selesai')->nullable();
            $table->date('tgl_bayar')->nullable();
            $table->integer('diskon')->nullable();
            $table->bigInteger('pajak')->nullable();
            $table->string('status');
            $table->string('ket_bayar');
            // $table->string('kd_pegawai');
            $table->foreignId('user_id')
            ->constrained('users')
            ->cascadeOnUpdate()
            ->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaksis');
    }
}
