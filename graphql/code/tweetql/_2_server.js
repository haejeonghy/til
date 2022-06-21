import { ApolloServer, gql} from "apollo-server"

let tweets = [
    {
        id:1,
        text:"졸려"
    },
    {
        id:2,
        text:"개잠옴"
    }
]

const typeDefs = gql`
# 모든 언어에서 이렇게 작업할 수 있다. 
    type User {
        id:ID!  
        username:String!
        firstname:String!
        lastname:String!
    }
    type Tweet {
        id:ID!
        text:String!
        author:User!
    }

    type Query {
        # allTweets 는 무조건 리스트를 줄텐데 Tweet이 무조건 들어가야 한다. 
        allTweets:[Tweet!]!
        # !를 붙이면 null을 허용하지 않는다. Non-nullable Fields
        tweet(id:ID!):Tweet
        ping:String!
    }
    type Mutation {
        postTweet(text:String!, userId:ID!):Tweet!
        deleteTweet(id:ID!):Boolean!
    }
`;

// 리퀘스트
// allTweets{
//     id 
// }

// {
//     tweet(id:"12312"){
//         text
//     }
// }

// query AllTweets {
//     allTweets {
//       id
//       text
  
//     }
//   }

// resolver 이름은 같아야 한다. Query, resolvers 등
const resolvers = {
                // 필드를 요청했을 때 실제로 호출될 험수
    Query: {

            // 무조건 첫번째는 root로 주어진다
            // 전달받은 args는 무조건 두번째로 들어온다
            // {
            //     tweet(id:"1"){
            //       id
            //       text
            //     }
              
            //   }
        tweet(root, {id}){
            return tweets.find((tweet) => tweet.id == id)
        }, 
        // query Query {
        //     ping
        //   }
        ping() {
            return "pong"
        },
        allTweets() {
            return tweets;
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