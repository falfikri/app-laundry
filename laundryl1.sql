-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Bulan Mei 2023 pada 16.14
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundryl1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `checkout_kilos`
--

CREATE TABLE `checkout_kilos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_invoice` varchar(255) NOT NULL,
  `kd_paket` varchar(255) NOT NULL,
  `berat_barang` int(11) NOT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `harga_paket` bigint(20) NOT NULL,
  `harga_antar` bigint(20) NOT NULL DEFAULT 0,
  `harga_total` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `checkout_kilos`
--

INSERT INTO `checkout_kilos` (`id`, `kd_invoice`, `kd_paket`, `berat_barang`, `metode_pembayaran`, `harga_paket`, `harga_antar`, `harga_total`, `created_at`, `updated_at`) VALUES
(1, 'I0001', 'PK001', 3, 'outlet', 15000, 0, 15000, '2023-02-19 04:56:42', '2023-02-19 04:56:42'),
(2, 'I0003', 'PK001', 15, 'rumah', 75000, 10000, 85000, '2023-03-07 07:30:57', '2023-03-07 07:30:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `checkout_satus`
--

CREATE TABLE `checkout_satus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_invoice` varchar(255) NOT NULL,
  `kd_barang` varchar(255) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `harga_barang` bigint(20) NOT NULL,
  `harga_antar` bigint(20) NOT NULL DEFAULT 0,
  `harga_total` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `checkout_satus`
--

INSERT INTO `checkout_satus` (`id`, `kd_invoice`, `kd_barang`, `jumlah_barang`, `metode_pembayaran`, `harga_barang`, `harga_antar`, `harga_total`, `created_at`, `updated_at`) VALUES
(1, 'I0002', 'PS001', 1, 'outlet', 12000, 10000, 22000, '2023-02-19 05:04:33', '2023-02-19 05:04:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_03_31_075733_create_outlet_table', 1),
(5, '2020_04_01_152610_create_paket_kilo_table', 1),
(6, '2020_04_01_152619_create_paket_satu_table', 1),
(7, '2020_04_03_101118_create_pelanggan_table', 1),
(8, '2020_04_08_220339_create_checkout_kilo_table', 1),
(9, '2020_04_08_220348_create_checkout_satu_table', 1),
(10, '2020_04_08_221537_create_transaksi_table', 1),
(11, '2020_04_08_223620_create_struk_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlets`
--

CREATE TABLE `outlets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `hotline` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `iframe_script` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `outlets`
--

INSERT INTO `outlets` (`id`, `nama`, `alamat`, `hotline`, `email`, `iframe_script`, `created_at`, `updated_at`) VALUES
(1, 'Bunda Laundry', 'perumahan permata galaxy', '0812345678', 'bundalaundry@laundry.net', NULL, '2023-02-19 04:53:40', '2023-02-19 04:53:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket_kilos`
--

CREATE TABLE `paket_kilos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_paket` varchar(255) NOT NULL,
  `nama_paket` varchar(255) NOT NULL,
  `harga_paket` bigint(20) NOT NULL,
  `hari_paket` int(11) NOT NULL,
  `min_berat_paket` int(11) NOT NULL,
  `antar_jemput_paket` tinyint(1) NOT NULL DEFAULT 0,
  `id_outlet` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `paket_kilos`
--

INSERT INTO `paket_kilos` (`id`, `kd_paket`, `nama_paket`, `harga_paket`, `hari_paket`, `min_berat_paket`, `antar_jemput_paket`, `id_outlet`, `created_at`, `updated_at`) VALUES
(1, 'PK001', 'Cuci Setrika', 5000, 3, 1, 0, 1, '2023-02-19 04:54:18', '2023-02-19 04:54:18'),
(2, 'PK002', 'Hanya setrika', 4000, 3, 1, 0, 1, '2023-02-19 04:54:54', '2023-02-19 04:54:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket_satus`
--

CREATE TABLE `paket_satus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `ket_barang` varchar(255) DEFAULT NULL,
  `harga_barang` bigint(20) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `paket_satus`
--

INSERT INTO `paket_satus` (`id`, `kd_barang`, `nama_barang`, `ket_barang`, `harga_barang`, `id_outlet`, `created_at`, `updated_at`) VALUES
(1, 'PS001', 'Baju', 'Baju kaos', 12000, 1, '2023-02-19 05:02:47', '2023-02-19 05:02:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggans`
--

CREATE TABLE `pelanggans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_pelanggan` varchar(255) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `jk_pelanggan` char(255) NOT NULL,
  `email_pelanggan` varchar(255) NOT NULL,
  `no_hp_pelanggan` varchar(255) NOT NULL,
  `alamat_pelanggan` varchar(255) NOT NULL,
  `cek_member` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pelanggans`
--

INSERT INTO `pelanggans` (`id`, `kd_pelanggan`, `nama_pelanggan`, `jk_pelanggan`, `email_pelanggan`, `no_hp_pelanggan`, `alamat_pelanggan`, `cek_member`, `password`, `created_at`, `updated_at`) VALUES
(1, 'K0001', 'imam', 'L', 'imam@laundry.net', '0811111111111', 'jalan ganet bukit raya', 'member', 'imam123', '2023-02-19 04:56:42', '2023-02-19 04:56:42'),
(2, 'K0002', 'onib', 'L', 'onib@laundry.net', '088888888888', 'jalan ganet bukit raya', 'non_member', 'onib123', '2023-02-19 05:04:33', '2023-02-19 05:04:33'),
(3, 'K0003', 'dani;', 'L', 'danil@gmail.com', '081234567890', 'jalan ganet hangtuah 5', 'member', 'danil', '2023-03-07 07:30:57', '2023-03-07 07:30:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `struks`
--

CREATE TABLE `struks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_invoice` varchar(255) NOT NULL,
  `harga_total` bigint(20) NOT NULL,
  `harga_bayar` bigint(20) NOT NULL,
  `harga_kembali` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `struks`
--

INSERT INTO `struks` (`id`, `kd_invoice`, `harga_total`, `harga_bayar`, `harga_kembali`, `created_at`, `updated_at`) VALUES
(1, 'I0001', 15000, 50000, 35000, '2023-02-19 04:56:42', '2023-02-19 04:56:42'),
(2, 'I0002', 22000, 22000, 0, '2023-02-19 05:04:32', '2023-02-19 05:04:32'),
(3, 'I0003', 85000, 85000, 0, '2023-03-07 07:39:39', '2023-03-07 07:39:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `kd_invoice` varchar(255) NOT NULL,
  `kd_pelanggan` varchar(255) NOT NULL,
  `tgl_pemberian` date NOT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `pajak` bigint(20) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `ket_bayar` varchar(255) NOT NULL,
  `kd_pegawai` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksis`
--

INSERT INTO `transaksis` (`id`, `id_outlet`, `kd_invoice`, `kd_pelanggan`, `tgl_pemberian`, `tgl_selesai`, `tgl_bayar`, `diskon`, `pajak`, `status`, `ket_bayar`, `kd_pegawai`, `created_at`, `updated_at`) VALUES
(1, 1, 'I0001', 'K0001', '2023-02-19', '2023-02-19', '2023-02-19', 0, 0, 'diambil', 'dibayar', 'U0001', '2023-02-19 04:56:42', '2023-03-07 07:37:36'),
(2, 1, 'I0002', 'K0002', '2023-02-19', '2023-02-19', '2023-02-19', 0, 0, 'diantar', 'dibayar', 'U0001', '2023-02-19 05:04:33', '2023-03-07 07:37:43'),
(3, 1, 'I0003', 'K0003', '2023-03-07', '2023-03-07', '2023-03-07', 0, 0, 'diambil', 'dibayar', 'U0001', '2023-03-07 07:30:57', '2023-03-07 07:41:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_pengguna` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `id_outlet` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `kd_pengguna`, `name`, `role`, `avatar`, `username`, `email_verified_at`, `password`, `id_outlet`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'U0001', 'admin@gmail.com', 'admin', 'default.png', 'admin', NULL, '$2y$10$OldIz5EqCfAlo7UP7wznXeZIw9bLZwLmH492/wNH9Xijb8WRAhiGi', 0, 'rVqKTKLbaX5iDT1mrq7ecWn5chSVp5jfRkdXwD1Pu88zrw5pfPiCnwT7760L', '2023-02-16 02:43:41', '2023-02-16 02:43:41'),
(2, 'K0001', 'imam', 'member', 'default.png', 'imam', NULL, '$2y$10$KjSB0Yy/NZGzVr0i.naCe.KSiqSG4Mv0TOGL4tQmFv0H7C9c.Tbqy', 0, 'aL5IovsFQ4AK9jdgIjc3FZkDNkwr9uapoDlSXvJIQ8sehJluVNoSWAHZqWqP', '2023-02-19 04:56:42', '2023-02-19 04:56:42'),
(3, 'K0002', 'onib', 'non_member', 'default.png', 'onib', NULL, '$2y$10$oJIz2dxCEoi7xCj9WDeVxeqkWqqaCONryXLulr/eKg3qj5yJh3N2.', 0, 'jsjdzQlLlvcKY8SxQeYCnlBRDoO9F7nySvKj9OgwMNjKcOQRsevtbM7Sjeiw', '2023-02-19 05:04:33', '2023-02-19 05:04:33'),
(4, 'U0002', 'kasir', 'kasir', 'default.png', 'kasir', NULL, '$2y$10$OGsY5abPvw.BsAN/TzKDuOFM6MjTC/hO2qGfGX../ecfGC6CBtWWe', 1, 'bs26GOMGVgxFJDuk005Mbe4bX5vabiFGydIsb9j59OgmVJBeOJluWVBXsDNg', '2023-02-19 05:11:50', '2023-02-21 08:17:52'),
(5, 'K0003', 'dani;', 'member', 'default.png', 'danil', NULL, '$2y$10$DzjIGES.oJJbRhrUwiRllOKxdhGlj1xnYYBNBWPg.q.harpF68MgO', 0, '1ySKupWorQM3wtC3h8zv7kOMnWUODgvJajs8y8adqRXib1yFdKEMtJZEHUMy', '2023-03-07 07:30:57', '2023-03-07 07:30:57'),
(6, 'U0003', 'kasir2', 'kasir', 'default.png', 'kasir2', NULL, '$2y$10$pd.r3lsiF11B26fi9g3yWutICYzWEXBZwTuSSCranFC5u8RqVLzpe', 1, 's2VhOfSvVxNG1DDkB3g0hncp7fEBltPqeg4hkjG2XpKMie89VFvBgUGk8D4u', '2023-04-18 08:22:55', '2023-04-18 08:22:55');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `checkout_kilos`
--
ALTER TABLE `checkout_kilos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `checkout_satus`
--
ALTER TABLE `checkout_satus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `outlets`
--
ALTER TABLE `outlets`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `paket_kilos`
--
ALTER TABLE `paket_kilos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `paket_satus`
--
ALTER TABLE `paket_satus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pelanggans`
--
ALTER TABLE `pelanggans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `struks`
--
ALTER TABLE `struks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `checkout_kilos`
--
ALTER TABLE `checkout_kilos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `checkout_satus`
--
ALTER TABLE `checkout_satus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `outlets`
--
ALTER TABLE `outlets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `paket_kilos`
--
ALTER TABLE `paket_kilos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `paket_satus`
--
ALTER TABLE `paket_satus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pelanggans`
--
ALTER TABLE `pelanggans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `struks`
--
ALTER TABLE `struks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
