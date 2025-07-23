<?php
session_start();
require_once 'includes/config.php';

if (is_logged_in()) {
    if (is_admin()) {
            redirect('pages/dashboard_admin.php');
                } elseif (is_guru()) {
                        redirect('pages/dashboard_guru.php');
                            } else {
                                    redirect('pages/dashboard_murid.php');
                                        }
                                        } else {
                                            redirect('pages/login.php');
                                            }
                                            ?>