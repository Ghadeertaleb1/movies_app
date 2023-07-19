import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/overview.dart';
import 'package:flutter_application_1/core/widgets/releas_date.dart';
import 'package:flutter_application_1/core/widgets/vote_average.dart';

import 'package:shimmer/shimmer.dart';
import '../../../core/utils/app_constant.dart';
import '../controller/movies_state.dart';

class SeeMorePopularComponent extends StatelessWidget {
  final MoviesState popularState;
  const SeeMorePopularComponent({super.key, required this.popularState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: popularState.popularMovies.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 130,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Card(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14)),
                        child: CachedNetworkImage(
                          width: 90,
                          height: 120,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstant.imageUrl(
                              popularState.popularMovies[index].backdropPath!),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: Text(
                            popularState.popularMovies[index].title,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                ReleasDate(
                                    releasDate: popularState
                                        .popularMovies[index].releaseDate,
                                    color: Colors.red),
                                const SizedBox(
                                  width: 10,
                                ),
                                VoteAverage(
                                  voteAverage: popularState
                                      .popularMovies[index].voteAverage,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Overview(
                                overview:
                                    popularState.popularMovies[index].overview,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
