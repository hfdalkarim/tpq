<?php
// Koneksi ke database
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'tpq_masjid';

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
    }

    // Fungsi untuk mencegah SQL injection
    function sanitize($data) {
        global $conn;
            return $conn->real_escape_string(htmlspecialchars(strip_tags(trim($data))));
            }

            // Fungsi untuk redirect
            function redirect($url) {
                header("Location: $url");
                    exit();
                    }

                    // Fungsi untuk mengecek login
                    function is_logged_in() {
                        return isset($_SESSION['user_id']);
                        }

                        // Fungsi untuk mengecek role
                        function is_admin() {
                            return isset($_SESSION['role']) && $_SESSION['role'] == 'Admin Pusat';
                            }

                            function is_guru() {
                                return isset($_SESSION['role']) && $_SESSION['role'] == 'Guru';
                                }

                                function is_murid() {
                                    return isset($_SESSION['role']) && $_SESSION['role'] == 'Murid';
                                    }

                                    // Fungsi untuk mendapatkan data masjid user
                                    function get_user_masjid_id() {
                                        return $_SESSION['masjid_id'] ?? null;
                                        }

                                        // Fungsi untuk mendapatkan data user
                                        function get_user_data() {
                                            if (!is_logged_in()) return null;
                                                
                                                    global $conn;
                                                        $user_id = $_SESSION['user_id'];
                                                            $query = "SELECT * FROM users WHERE id = $user_id";
                                                                $result = $conn->query($query);
                                                                    
                                                                        return $result->fetch_assoc();
                                                                        }

                                                                        // Fungsi untuk upload file
                                                                        function upload_file($file, $target_dir, $allowed_types = ['jpg', 'jpeg', 'png', 'gif']) {
                                                                            $target_file = $target_dir . basename($file["name"]);
                                                                                $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
                                                                                    
                                                                                        // Check if file already exists
                                                                                            if (file_exists($target_file)) {
                                                                                                    return ['success' => false, 'message' => 'File sudah ada.'];
                                                                                                        }
                                                                                                            
                                                                                                                // Check file size (5MB max)
                                                                                                                    if ($file["size"] > 5000000) {
                                                                                                                            return ['success' => false, 'message' => 'Ukuran file terlalu besar (maks 5MB).'];
                                                                                                                                }
                                                                                                                                    
                                                                                                                                        // Allow certain file formats
                                                                                                                                            if (!in_array($imageFileType, $allowed_types)) {
                                                                                                                                                    return ['success' => false, 'message' => 'Hanya file ' . implode(', ', $allowed_types) . ' yang diizinkan.'];
                                                                                                                                                        }
                                                                                                                                                            
                                                                                                                                                                // Try to upload file
                                                                                                                                                                    if (move_uploaded_file($file["tmp_name"], $target_file)) {
                                                                                                                                                                            return ['success' => true, 'file_path' => $target_file];
                                                                                                                                                                                } else {
                                                                                                                                                                                        return ['success' => false, 'message' => 'Terjadi kesalahan saat upload file.'];
                                                                                                                                                                                            }
                                                                                                                                                                                            }
                                                                                                                                                                                            ?>