import NavBar from "../components/NavBar";
import Head from "next/head"
import Header from "../components/Header";

export default function Home() {
    return (
        <div>
            {/* html header에 들어가는 부분 */}
            <Header/>
            <NavBar/>
            <h1>Hi</h1>
        </div>
    )
}
