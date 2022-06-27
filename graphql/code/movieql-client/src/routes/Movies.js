import { useApolloClient, gql } from "@apollo/client"
import { useEffect, useState } from "react";

export default function Movies() {
    const [movies, setMovies] = useState([])
    // 이게 client.js 파일에서 하는 것과 같음
    const client = useApolloClient();
    useEffect(() => {
        client.query({
            query:gql`
            {
                allMovies {
                    title
                    id
                }
            }
            `
        }).then(results => setMovies(results.data.allMovies))
    }, [client]);
    return (
        <div>
            {movies.map((movie) => (
                <li key={movie.id}>{movie.title}</li>
            ))}
        </div>
    )

}