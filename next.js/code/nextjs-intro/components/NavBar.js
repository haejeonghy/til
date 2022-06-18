import Link from "next/link";
import {useRouter} from "next/router"
// import styles from './NavBar.module.css'
export default function NavBar() {
    const router = useRouter()

    return (
        <nav>
            {/* <nav className={styles.nav}> */}
            <Link href="/">
                    {/* <a className={`${styles.link} ${router.pathname === '/'? styles.active:''}`}>Home</a>> */}
            </Link>
            <Link href="/about"><a>About</a></Link>
            <style jsx>{`
                    nav {
                        background-color:yellow
                    }`
                }
            </style>
        </nav>
    )

}
