import Layout from "../components/Layout";

export default function App({Component, pageProps}) {
    // 사용자가 작성한 리턴에 추가로 다른 컴포넌트를 렌덩힌다.
    return <Layout><Component {...pageProps}/></Layout>
}