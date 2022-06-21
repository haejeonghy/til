import { ApolloServer, gql} from "apollo-server"

// 이렇게만 요청하면 스키마, 모듈, typeDefs 등이 필요하다는 에러 발생
// const server = new ApolloServer({})
// server.listen().then(({url}) => {
//     console.log(`Running on ${url}`)
// })

// graphQL에게 설명하는 것
// 쿼리타입에 넣는게 유저가 리퀘스트 할 수 있는 것
// 쿼리 타입에 넣는게 GET request url 노출하는 것과 같다
// scalar type은 내장되어있다. 
// 데이터를 받거나 조회하게 하고 싶으면 명시해야 한다.
const typeDefs = gql`
    type User {
        id:ID  
        username:String
    }
    # 고유 타입 생성
    type Tweet {
        id:ID
        text:String
        # 데이터베이스 관계에 따라 결정된다
        author:User
    }

    # Get Request 만드는 것과 같다. 
    type Query {
        # Tweet 타입으로 조회하겠다고 지정
        allTweets:[Tweet] 
        # 트윗 id 받아서 트윗 하나 리턴 (argument) 설정
        tweet(id:ID):Tweet
    }
    # POST Request 만드는 것과 같다. 
    type Mutation {
        # text, user id를 받아서 새로 발행된 tweet 리턴
        postTweet(text:String, userId:ID):Tweet
        # tweet 삭제 후 결과 값 리턴
        deleteTweet(id:ID):Boolean
    }
`;

// 리퀘스트 할 때 
// {
//     allTweets {
//         text
//     }
//     tweet(id:"1") { argument로 1 넘기기
//         author {
//             username
//         }
//     }
// }

// mutation 리퀘스트
// mutation {
//     postTweet(text:"hello, first tweet", userId:"1") {
//       text
//     }
//   }
const server = new ApolloServer({typeDefs})
server.listen().then(({url}) => {
    console.log(`Running on ${url}`)
})