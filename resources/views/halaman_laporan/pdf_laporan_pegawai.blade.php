<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Laporan Pegawai</title>
	<style>
		html{
			margin: 0;
			padding: 0;
			font-family: "Nunito", sans-serif;
		}
		.header{
			width: 100%;
			height: auto;
			background-color: #f7f7f7f7;
			padding-bottom: 50px;
		}
		.logo-laundry{
			object-fit: cover;
			width: 4rem;
			height: 4rem;
		}
		.text-right{
			text-align: right;
		}
		.text-center{
			text-align: right;
		}
		.table-header tr td{
			padding: 5px;
			color: #999999;
			font-size: 12px;
		}
		.table-content tr th{
			padding: 8px;
			font-size: 11px;
			color: #999999;
			border-bottom: 1px solid #ddd;
		}
		.table-content tr td{
			padding: 8px;
			font-size: 11px;
			color: #454545;
			border-bottom: 1px solid #ddd;
		}
		.body-content{
			margin-top: 50px;
		}
		.badge {
			border-radius: 8px;
			color: #fff;
			display: inline-block;
			line-height: 1;
			min-width: 10px;
			font-size: 10px;
			font-weight: bold;
			padding: 3px 7px;
			text-align: center;
			vertical-align: middle;
			white-space: nowrap;
		}
		.badge-info{
			background-color: #4d7cff;
		}
		.badge-warning{
			background-color: #f29d56;
		}
		.badge-danger{
			background-color: #ff5e5e;
		}
		.badge-success{
			background-color: #6fd96f;
		}
		.badge-primary{
			background-color: #7571f9;
		}
	</style>
</head>
<body>
    <div class="header">
        <table class="table-header">
            <tr>
                <td><img src="{{ public_path('icons/pratama_icon.png') }}" class="logo-laundry"></td>
                <td class="text-right">
                    Princess Laundry<br>
                </td>
            </tr>
            <tr>
                <td><strong>PEGAWAI</strong></td>
                <td class="text-right" style="font-size: 28px;">Invoice</td>
            </tr>
            <tr>
                <td><strong>Kode:</strong> 1234</td>
                <td class="text-right">
                    @if($tanggal != '')
                        {{ $tanggal }}
                    @else
                        {{ date('d M Y', strtotime($start_date2)) . ' - ' . date('d M Y', strtotime($end_date2)) }}
                    @endif
                </td>
            </tr>
            <tr>
                <td><strong>Posisi:</strong> Admin</td>
            </tr>
            <tr>
                <td><strong>Nama:</strong> Testing 2</td>
            </tr>
        </table>
    </div>

    <div class="body-content">
        <table class="table-content" border="1">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>OUTLET</th>
                    <th>KD INVOICE</th>
                    <th>PELANGGAN</th>
                    <th>TGL PEMBERIAN</th>
                    <th>KET BAYAR</th>
                    <th>STATUS</th>
                </tr>
            </thead>
            <tbody>
                @foreach($transaksi as $trx)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $trx->outlet?->nama }}</td>
                    <td>{{ $trx->kd_invoice }}</td>
                    <td>{{ $trx->pelanggan?->nama_pelanggan }}</td>
                    <td>{{ date('d M Y', strtotime($trx->tgl_pemberian)) }}</td>
                    <td>{{ $trx->ket_bayar }}</td>
                    <td>
                        @if($trx->status == 'baru')
                        <span class="badge badge-info">{{ $trx->status }}</span>
                        @elseif($trx->status == 'proses')
                        <span class="badge badge-warning">{{ $trx->status }}</span>
                        @elseif($trx->status == 'selesai')
                        <span class="badge badge-success">{{ $trx->status }}</span>
                        @elseif($trx->status == 'diantar')
                        <span class="badge badge-danger">{{ $trx->status }}</span>
                        @elseif($trx->status == 'diambil')
                        <span class="badge badge-primary">{{ $trx->status }}</span>
                        @endif
                    </td>
                </tr>
                @endforeach
                <tr>
                    <td colspan="5" style="border-bottom: 0px;"></td>
                    <td><strong>JUMLAH</strong></td>
                    <td>{{ $transaksi->count() }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
