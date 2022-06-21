import { ApolloServer, gql} from "apollo-server"
import fetch from "node-fetch"
let tweets = [
    {
        id:1,
        text:"졸려",
        userId:"2"
    },
    {
        id:2,
        text:"개잠옴",
        userId:"1"
    }
]

let users = [{
    id:"1",
    firstname:"nico",
    lastname:"las"
}, {
    id:"2",
    firstname:"elon",
    lastname:"mask"
}]

const typeDefs = gql`
    type Movie {
        id:Int!
        url:String!
        genres:[String]!
        description:String!
        title:String!
    }
    type User {
        id:ID!  
        username:String!
        firstname:String!
        lastname:String!
        fullname:String
    }
    """
    Tweet에 대한 설명이 있다
    """
    type Tweet {
        id:ID!
        text:String!
        author:User!
    }

    type Query {
        allTweets:[Tweet!]!
        tweet(id:ID!):Tweet
        ping:String!
        allUsers:[User]
        allMovies:[Movie!]!
    }
    type Mutation {
        postTweet(text:String!, userId:ID!):Tweet!
        deleteTweet(id:ID!):Boolean!
    }
`;

const resolvers = {
    Tweet: {
        // tweets랑 users 연결
        // author가 tweet 타입에 없는 걸 알면 리졸버에서 해결하려고 함
        author({userId}){
            return users.find((user) => user.id == userId)
        }
    },
    User: {
        fullname({firstname, lastname}) {
            return `${firstname} ${lastname}`;
        }
    },
    Query: {

        tweet(root, {id}){
            return tweets.find((tweet) => tweet.id == id)
        }, 
        ping() {
            return "pong"
        },
        allTweets() {
            return tweets;
        },
        allUsers() {
            return users;
        },
        allMovies() {
            // 다른 서버에 요청한 데이터를 graphql 데이터로 변환
            // graphql은 데이터를 어디서든 받아오게 해준다.
            // 
            return fetch("https://yts.mx/api/v2/list_movies.json")
            .then((r) => r.json())
            .then((json) => json.data.movies);
            // query AllMovies {
            //     allMovies {
            //       title
            //     }
            //   }
        }

    },
    Mutation: {
        postTweet(_, {text, userId}){
            const newTweet = {
                id:tweets.length+1,
                text
            };
            tweets.push(newTweet)
            return tweets[tweets.length -1]
        },
        deleteTweet(_, {id}) {
            const tweet = tweets.find(tweet => tweet.id == id)
            if(!tweet) return false
            tweets = tweets.filter(tweet => tweet.id != id)
            return true
        }
    }
}

const server = new ApolloServer({typeDefs, resolvers})
server.listen().then(({url}) => {
    console.log(`Running on ${url}`)
})