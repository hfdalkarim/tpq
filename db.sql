-- Database: tpq_masjid

-- Tabel masjid
CREATE TABLE `masjid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
    `nama` varchar(100) NOT NULL,
      `logo` varchar(255) DEFAULT NULL,
        `alamat` text NOT NULL,
          `koordinat` varchar(100) DEFAULT NULL,
            `jadwal_sholat` text DEFAULT NULL,
              PRIMARY KEY (`id`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

              -- Tabel users
              CREATE TABLE `users` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                  `masjid_id` int(11) DEFAULT NULL,
                    `nama` varchar(100) NOT NULL,
                      `username` varchar(50) NOT NULL,
                        `password` varchar(255) NOT NULL,
                          `role` enum('Admin Pusat','Guru','Murid') NOT NULL,
                            PRIMARY KEY (`id`),
                              UNIQUE KEY `username` (`username`),
                                KEY `masjid_id` (`masjid_id`),
                                  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`masjid_id`) REFERENCES `masjid` (`id`) ON DELETE SET NULL
                                  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                  -- Tabel guru
                                  CREATE TABLE `guru` (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `user_id` int(11) NOT NULL,
                                        `masjid_id` int(11) NOT NULL,
                                          `nama` varchar(100) NOT NULL,
                                            `no_hp` varchar(20) DEFAULT NULL,
                                              `email` varchar(100) DEFAULT NULL,
                                                `foto` varchar(255) DEFAULT NULL,
                                                  PRIMARY KEY (`id`),
                                                    KEY `user_id` (`user_id`),
                                                      KEY `masjid_id` (`masjid_id`),
                                                        CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                                          CONSTRAINT `guru_ibfk_2` FOREIGN KEY (`masjid_id`) REFERENCES `masjid` (`id`) ON DELETE CASCADE
                                                          ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                                          -- Tabel murid
                                                          CREATE TABLE `murid` (
                                                            `id` int(11) NOT NULL AUTO_INCREMENT,
                                                              `user_id` int(11) NOT NULL,
                                                                `masjid_id` int(11) NOT NULL,
                                                                  `nama` varchar(100) NOT NULL,
                                                                    `tanggal_lahir` date DEFAULT NULL,
                                                                      `level` enum('Iqro','Quran','Tahfidz') NOT NULL,
                                                                        `status_level` enum('Aktif','Tamat') DEFAULT 'Aktif',
                                                                          `foto` varchar(255) DEFAULT NULL,
                                                                            PRIMARY KEY (`id`),
                                                                              KEY `user_id` (`user_id`),
                                                                                KEY `masjid_id` (`masjid_id`),
                                                                                  CONSTRAINT `murid_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                                                                    CONSTRAINT `murid_ibfk_2` FOREIGN KEY (`masjid_id`) REFERENCES `masjid` (`id`) ON DELETE CASCADE
                                                                                    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                                                                    -- Tabel surah
                                                                                    CREATE TABLE `surah` (
                                                                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                                                                        `nama_surah` varchar(50) NOT NULL,
                                                                                          `jumlah_ayat` int(11) NOT NULL,
                                                                                            PRIMARY KEY (`id`)
                                                                                            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                                                                            -- Tabel ayat
                                                                                            CREATE TABLE `ayat` (
                                                                                              `id` int(11) NOT NULL AUTO_INCREMENT,
                                                                                                `surah_id` int(11) NOT NULL,
                                                                                                  `nomor_ayat` int(11) NOT NULL,
                                                                                                    `teks` text NOT NULL,
                                                                                                      PRIMARY KEY (`id`),
                                                                                                        KEY `surah_id` (`surah_id`),
                                                                                                          CONSTRAINT `ayat_ibfk_1` FOREIGN KEY (`surah_id`) REFERENCES `surah` (`id`) ON DELETE CASCADE
                                                                                                          ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                                                                                          -- Tabel setoran_hafalan
                                                                                                          CREATE TABLE `setoran_hafalan` (
                                                                                                            `id` int(11) NOT NULL AUTO_INCREMENT,
                                                                                                              `murid_id` int(11) NOT NULL,
                                                                                                                `guru_id` int(11) NOT NULL,
                                                                                                                  `surah_id` int(11) NOT NULL,
                                                                                                                    `ayat_awal` int(11) NOT NULL,
                                                                                                                      `ayat_akhir` int(11) NOT NULL,
                                                                                                                        `tanggal` date NOT NULL,
                                                                                                                          `nilai` enum('A','B','C','D') DEFAULT NULL,
                                                                                                                            `catatan` text DEFAULT NULL,
                                                                                                                              PRIMARY KEY (`id`),
                                                                                                                                KEY `murid_id` (`murid_id`),
                                                                                                                                  KEY `guru_id` (`guru_id`),
                                                                                                                                    KEY `surah_id` (`surah_id`),
                                                                                                                                      CONSTRAINT `setoran_hafalan_ibfk_1` FOREIGN KEY (`murid_id`) REFERENCES `murid` (`id`) ON DELETE CASCADE,
                                                                                                                                        CONSTRAINT `setoran_hafalan_ibfk_2` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`) ON DELETE CASCADE,
                                                                                                                                          CONSTRAINT `setoran_hafalan_ibfk_3` FOREIGN KEY (`surah_id`) REFERENCES `surah` (`id`) ON DELETE CASCADE
                                                                                                                                          ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                                                                                                                          -- Tabel progres_bacaan
                                                                                                                                          CREATE TABLE `progres_bacaan` (
                                                                                                                                            `id` int(11) NOT NULL AUTO_INCREMENT,
                                                                                                                                              `murid_id` int(11) NOT NULL,
                                                                                                                                                `guru_id` int(11) NOT NULL,
                                                                                                                                                  `jenis` enum('Iqro','Quran','Tahfidz') NOT NULL,
                                                                                                                                                    `halaman_terakhir` varchar(50) NOT NULL,
                                                                                                                                                      `tanggal_update` date NOT NULL,
                                                                                                                                                        `komentar` text DEFAULT NULL,
                                                                                                                                                          PRIMARY KEY (`id`),
                                                                                                                                                            KEY `murid_id` (`murid_id`),
                                                                                                                                                              KEY `guru_id` (`guru_id`),
                                                                                                                                                                CONSTRAINT `progres_bacaan_ibfk_1` FOREIGN KEY (`murid_id`) REFERENCES `murid` (`id`) ON DELETE CASCADE,
                                                                                                                                                                  CONSTRAINT `progres_bacaan_ibfk_2` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`) ON DELETE CASCADE
                                                                                                                                                                  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                                                                                                                                                  -- Tabel logbook
                                                                                                                                                                  CREATE TABLE `logbook` (
                                                                                                                                                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                                                                                                                                                      `masjid_id` int(11) NOT NULL,
                                                                                                                                                                        `tanggal` date NOT NULL,
                                                                                                                                                                          `kegiatan` varchar(255) NOT NULL,
                                                                                                                                                                            `jumlah_murid` int(11) DEFAULT NULL,
                                                                                                                                                                              `catatan` text DEFAULT NULL,
                                                                                                                                                                                PRIMARY KEY (`id`),
                                                                                                                                                                                  KEY `masjid_id` (`masjid_id`),
                                                                                                                                                                                    CONSTRAINT `logbook_ibfk_1` FOREIGN KEY (`masjid_id`) REFERENCES `masjid` (`id`) ON DELETE CASCADE
                                                                                                                                                                                    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                                                                                                                                                                    -- Tabel kategori_media
                                                                                                                                                                                    CREATE TABLE `kategori_media` (
                                                                                                                                                                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                                                                                                                                                                        `nama_kategori` varchar(50) NOT NULL,
                                                                                                                                                                                          PRIMARY KEY (`id`)
                                                                                                                                                                                          ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                                                                                                                                                                          -- Tabel media
                                                                                                                                                                                          CREATE TABLE `media` (
                                                                                                                                                                                            `id` int(11) NOT NULL AUTO_INCREMENT,
                                                                                                                                                                                              `uploader_id` int(11) NOT NULL,
                                                                                                                                                                                                `judul` varchar(100) NOT NULL,
                                                                                                                                                                                                  `deskripsi` text DEFAULT NULL,
                                                                                                                                                                                                    `kategori` varchar(50) DEFAULT NULL,
                                                                                                                                                                                                      `tipe` enum('PDF','Youtube') NOT NULL,
                                                                                                                                                                                                        `link_atau_file` varchar(255) NOT NULL,
                                                                                                                                                                                                          `tanggal_upload` datetime NOT NULL DEFAULT current_timestamp(),
                                                                                                                                                                                                            PRIMARY KEY (`id`),
                                                                                                                                                                                                              KEY `uploader_id` (`uploader_id`),
                                                                                                                                                                                                                CONSTRAINT `media_ibfk_1` FOREIGN KEY (`uploader_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
                                                                                                                                                                                                                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                                                                                                                                                                                                -- Tabel leaderboard
                                                                                                                                                                                                                CREATE TABLE `leaderboard` (
                                                                                                                                                                                                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                                                                                                                                                                                                    `murid_id` int(11) NOT NULL,
                                                                                                                                                                                                                      `poin` int(11) NOT NULL DEFAULT 0,
                                                                                                                                                                                                                        `tanggal_update` date NOT NULL,
                                                                                                                                                                                                                          PRIMARY KEY (`id`),
                                                                                                                                                                                                                            KEY `murid_id` (`murid_id`),
                                                                                                                                                                                                                              CONSTRAINT `leaderboard_ibfk_1` FOREIGN KEY (`murid_id`) REFERENCES `murid` (`id`) ON DELETE CASCADE
                                                                                                                                                                                                                              ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                                                                                                                                                                                                              -- Tabel jadwal_mingguan
                                                                                                                                                                                                                              CREATE TABLE `jadwal_mingguan` (
                                                                                                                                                                                                                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                                                                                                                                                                                                                  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') NOT NULL,
                                                                                                                                                                                                                                    `jam` time NOT NULL,
                                                                                                                                                                                                                                      `jenis_kegiatan` enum('Materi','Sema\'an','Hafalan','Kajian') NOT NULL,
                                                                                                                                                                                                                                        `masjid_id` int(11) DEFAULT NULL,
                                                                                                                                                                                                                                          `catatan` text DEFAULT NULL,
                                                                                                                                                                                                                                            PRIMARY KEY (`id`),
                                                                                                                                                                                                                                              KEY `masjid_id` (`masjid_id`),
                                                                                                                                                                                                                                                CONSTRAINT `jadwal_mingguan_ibfk_1` FOREIGN KEY (`masjid_id`) REFERENCES `masjid` (`id`) ON DELETE SET NULL
                                                                                                                                                                                                                                                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

                                                                                                                                                                                                                                                -- Insert data awal (admin pusat)
                                                                                                                                                                                                                                                INSERT INTO `users` (`id`, `masjid_id`, `nama`, `username`, `password`, `role`) VALUES
                                                                                                                                                                                                                                                (1, NULL, 'Admin Pusat', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Admin Pusat');