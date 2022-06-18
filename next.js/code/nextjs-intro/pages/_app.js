export default function App({Component, pageProps}) {
    // 사용자가 작성한 리턴에 추가로 다른 컴포넌트를 렌덩힌다.
    return <div><Component {...pageProps}/></div>
}