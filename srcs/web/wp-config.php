<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '&) l.?NerB>Z63u>Gr_wYXB{fsOCW_1G7Tm[M=qAoH7g8)ckZ7f]9~RgH5.l4[5M' );
define( 'SECURE_AUTH_KEY',   'K6jHKQfWT~./n*9p_3o#9yii$nu(W;1=xI x[QnL0-0q%r #fyk/B5za5tw,XUvO' );
define( 'LOGGED_IN_KEY',     '#?W[$m+?nm.vctlpbP0k(Vjlss]$, Yk)7 >|EvKK%,Bax>tYlUlwn<@:Sxb7a:$' );
define( 'NONCE_KEY',         ',|h#+3Z1w],7@MWhI>*m8weIpJ-B2LT~E|nQh.7b4Ej91@9VXd{sHys.2yF}KLk5' );
define( 'AUTH_SALT',         '+r.dSrrAB27?X#b~iH|mdvbqUI!ZDw#Q!6pPSTN?@sOx?dNv^W*U5OT$EKB0+y?5' );
define( 'SECURE_AUTH_SALT',  'cUXg-eD3WiyrCKpIN>mwAN+Qw .!K%7I/su59 D[:V:]l%=XvNb`7yCtfMGL~7#}' );
define( 'LOGGED_IN_SALT',    'KAat1>jZS)x`,_xHr^y<m}mQ}g(.fRt(Z+hw%h}]aplaa1uSH0:ywEyQ[4bgE2*y' );
define( 'NONCE_SALT',        '_H,JLK/~k%js6>`[+:n8hH}j>zA=R<u-I)3BGBT1&9I;Wo1M`5*F[gG]Z+0o^3Lw' );
define( 'WP_CACHE_KEY_SALT', '_N~D?9ql5sUny^IBVp/!:!jV~D{u-2qCQQ3FWaR*_>J)Mb+3>dW~Fid>H>gKibyb' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
